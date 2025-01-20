@interface NTPBPaidSubscriptionSheetView
- (BOOL)arrivedFromAd;
- (BOOL)hasArrivedFromAd;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCreativeId;
- (BOOL)hasGroupType;
- (BOOL)hasIadQtoken;
- (BOOL)hasPaidSubscriptionConversionPointExposureLocation;
- (BOOL)hasPaidSubscriptionConversionPointType;
- (BOOL)hasPaidSubscriptionSheetViewPresentationReason;
- (BOOL)hasParentFeedType;
- (BOOL)hasSectionId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSubscriptionOnlyArticlePreview;
- (BOOL)hasSubscriptionPurchaseSessionId;
- (BOOL)hasUserAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)subscriptionOnlyArticlePreview;
- (NSData)articleViewingSessionId;
- (NSData)subscriptionPurchaseSessionId;
- (NSString)articleId;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)iadQtoken;
- (NSString)sectionId;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupTypeAsString:(int)a3;
- (id)paidSubscriptionConversionPointExposureLocationAsString:(int)a3;
- (id)paidSubscriptionConversionPointTypeAsString:(int)a3;
- (id)parentFeedTypeAsString:(int)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsPaidSubscriptionConversionPointExposureLocation:(id)a3;
- (int)StringAsPaidSubscriptionConversionPointType:(id)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)groupType;
- (int)paidSubscriptionConversionPointExposureLocation;
- (int)paidSubscriptionConversionPointType;
- (int)paidSubscriptionSheetViewPresentationReason;
- (int)parentFeedType;
- (int)userAction;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArrivedFromAd:(BOOL)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setHasArrivedFromAd:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointExposureLocation:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3;
- (void)setHasPaidSubscriptionSheetViewPresentationReason:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setIadQtoken:(id)a3;
- (void)setPaidSubscriptionConversionPointExposureLocation:(int)a3;
- (void)setPaidSubscriptionConversionPointType:(int)a3;
- (void)setPaidSubscriptionSheetViewPresentationReason:(int)a3;
- (void)setParentFeedType:(int)a3;
- (void)setSectionId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setSubscriptionPurchaseSessionId:(id)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPaidSubscriptionSheetView

- (int)userAction
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserAction
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (int)paidSubscriptionSheetViewPresentationReason
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_paidSubscriptionSheetViewPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionSheetViewPresentationReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_paidSubscriptionSheetViewPresentationReason = a3;
}

- (void)setHasPaidSubscriptionSheetViewPresentationReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPaidSubscriptionSheetViewPresentationReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)paidSubscriptionConversionPointExposureLocation
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_paidSubscriptionConversionPointExposureLocation;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointExposureLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_paidSubscriptionConversionPointExposureLocation = a3;
}

- (void)setHasPaidSubscriptionConversionPointExposureLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointExposureLocation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)paidSubscriptionConversionPointExposureLocationAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444E7D0[a3];
  }

  return v3;
}

- (int)StringAsPaidSubscriptionConversionPointExposureLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PAID_SUBSCRIPTION_CONVERSION_POINT_EXPOSURE_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IN_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_EXPOSURE_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_EXPOSURE_LOCATION"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasSectionId
{
  return self->_sectionId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (int)parentFeedType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_parentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setParentFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444E7E8[a3];
  }

  return v3;
}

- (int)StringAsParentFeedType:(id)a3
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

- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setArrivedFromAd:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_arrivedFromAd = a3;
}

- (void)setHasArrivedFromAd:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasArrivedFromAd
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasIadQtoken
{
  return self->_iadQtoken != 0;
}

- (int)paidSubscriptionConversionPointType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_paidSubscriptionConversionPointType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444E898[a3];
  }

  return v3;
}

- (int)StringAsPaidSubscriptionConversionPointType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_IN_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUBSCRIBER_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"IN_FEED_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_EXPIRATION_RENEWAL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TOP_OF_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"INTERSTITIAL_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"GROUP_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LANDING_PAGE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ISSUE_TOC_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"AUDIO_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_OFFERS_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSubscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId != 0;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (BOOL)hasCampaignType
{
  return self->_campaignType != 0;
}

- (BOOL)hasCreativeId
{
  return self->_creativeId != 0;
}

- (int)groupType
{
  if (*(unsigned char *)&self->_has) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroupType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_26444E948[a3];
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPaidSubscriptionSheetView;
  int v4 = [(NTPBPaidSubscriptionSheetView *)&v8 description];
  v5 = [(NTPBPaidSubscriptionSheetView *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v5 forKey:@"user_action"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithInt:self->_paidSubscriptionSheetViewPresentationReason];
  [v3 setObject:v6 forKey:@"paid_subscription_sheet_view_presentation_reason"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t paidSubscriptionConversionPointExposureLocation = self->_paidSubscriptionConversionPointExposureLocation;
  if (paidSubscriptionConversionPointExposureLocation >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointExposureLocation);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_26444E7D0[paidSubscriptionConversionPointExposureLocation];
  }
  [v3 setObject:v8 forKey:@"paid_subscription_conversion_point_exposure_location"];

LABEL_11:
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  sectionId = self->_sectionId;
  if (sectionId) {
    [v3 setObject:sectionId forKey:@"section_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v3 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  char v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    uint64_t parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_26444E7E8[parentFeedType];
    }
    [v3 setObject:v19 forKey:@"parent_feed_type"];

    char v13 = (char)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_21:
      if ((v13 & 0x40) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_21;
  }
  v26 = [NSNumber numberWithBool:self->_subscriptionOnlyArticlePreview];
  [v3 setObject:v26 forKey:@"subscription_only_article_preview"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_22:
    v14 = [NSNumber numberWithBool:self->_arrivedFromAd];
    [v3 setObject:v14 forKey:@"arrived_from_ad"];
  }
LABEL_23:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken) {
    [v3 setObject:iadQtoken forKey:@"iad_qtoken"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_26444E898[paidSubscriptionConversionPointType];
    }
    [v3 setObject:v17 forKey:@"paid_subscription_conversion_point_type"];
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if (subscriptionPurchaseSessionId) {
    [v3 setObject:subscriptionPurchaseSessionId forKey:@"subscription_purchase_session_id"];
  }
  campaignId = self->_campaignId;
  if (campaignId) {
    [v3 setObject:campaignId forKey:@"campaign_id"];
  }
  campaignType = self->_campaignType;
  if (campaignType) {
    [v3 setObject:campaignType forKey:@"campaign_type"];
  }
  creativeId = self->_creativeId;
  if (creativeId) {
    [v3 setObject:creativeId forKey:@"creative_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_26444E948[groupType];
    }
    [v3 setObject:v25 forKey:@"group_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaidSubscriptionSheetViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleViewingSessionId) {
    PBDataWriterWriteDataField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v5 = (char)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_15:
      if ((v5 & 0x40) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_16:
  }
    PBDataWriterWriteBOOLField();
LABEL_17:
  if (self->_iadQtoken) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_subscriptionPurchaseSessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_campaignId) {
    PBDataWriterWriteStringField();
  }
  if (self->_campaignType) {
    PBDataWriterWriteStringField();
  }
  if (self->_creativeId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_userAction;
    *(unsigned char *)(v5 + 112) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_paidSubscriptionSheetViewPresentationReason;
  *(unsigned char *)(v5 + 112) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 64) = self->_paidSubscriptionConversionPointExposureLocation;
    *(unsigned char *)(v5 + 112) |= 2u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v9 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v8;

  uint64_t v10 = [(NSString *)self->_sectionId copyWithZone:a3];
  v11 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v10;

  uint64_t v12 = [(NSString *)self->_articleId copyWithZone:a3];
  char v13 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v12;

  uint64_t v14 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v15 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v14;

  char v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 76) = self->_parentFeedType;
    *(unsigned char *)(v6 + 112) |= 0x10u;
    char v16 = (char)self->_has;
    if ((v16 & 0x80) == 0)
    {
LABEL_7:
      if ((v16 & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v6 + 109) = self->_subscriptionOnlyArticlePreview;
  *(unsigned char *)(v6 + 112) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 108) = self->_arrivedFromAd;
    *(unsigned char *)(v6 + 112) |= 0x40u;
  }
LABEL_9:
  uint64_t v17 = [(NSString *)self->_iadQtoken copyWithZone:a3];
  v18 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v17;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_paidSubscriptionConversionPointType;
    *(unsigned char *)(v6 + 112) |= 4u;
  }
  uint64_t v19 = [(NSData *)self->_subscriptionPurchaseSessionId copyWithZone:a3];
  v20 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v19;

  uint64_t v21 = [(NSString *)self->_campaignId copyWithZone:a3];
  v22 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v21;

  uint64_t v23 = [(NSString *)self->_campaignType copyWithZone:a3];
  v24 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v23;

  uint64_t v25 = [(NSString *)self->_creativeId copyWithZone:a3];
  v26 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v25;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 48) = self->_groupType;
    *(unsigned char *)(v6 + 112) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x20) == 0 || self->_userAction != *((_DWORD *)v4 + 26)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 8) == 0 || self->_paidSubscriptionSheetViewPresentationReason != *((_DWORD *)v4 + 18)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 2) == 0
      || self->_paidSubscriptionConversionPointExposureLocation != *((_DWORD *)v4 + 16))
    {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    goto LABEL_67;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 11)
    && !-[NSString isEqual:](sourceChannelId, "isEqual:"))
  {
    goto LABEL_67;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:")) {
      goto LABEL_67;
    }
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_67;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_67;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x10) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 19)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x80) == 0) {
      goto LABEL_67;
    }
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_67;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x80) != 0)
  {
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x40) == 0) {
      goto LABEL_67;
    }
    if (self->_arrivedFromAd)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_67;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x40) != 0)
  {
    goto LABEL_67;
  }
  iadQtoken = self->_iadQtoken;
  if (!((unint64_t)iadQtoken | *((void *)v4 + 7))) {
    goto LABEL_49;
  }
  if (!-[NSString isEqual:](iadQtoken, "isEqual:"))
  {
LABEL_67:
    BOOL v15 = 0;
    goto LABEL_68;
  }
  char has = (char)self->_has;
LABEL_49:
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 4) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 17)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 4) != 0)
  {
    goto LABEL_67;
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((void *)v4 + 12)
    && !-[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:"))
  {
    goto LABEL_67;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_67;
    }
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_67;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_67;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 12)) {
      goto LABEL_67;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (*((unsigned char *)v4 + 112) & 1) == 0;
  }
LABEL_68:

  return v15;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v3 = 2654435761 * self->_userAction;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v26 = v3;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_paidSubscriptionSheetViewPresentationReason;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v25 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v20 = 2654435761 * self->_paidSubscriptionConversionPointExposureLocation;
  }
  else {
    uint64_t v20 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v6 = [(NSString *)self->_sectionId hash];
  NSUInteger v24 = [(NSString *)self->_articleId hash];
  uint64_t v7 = [(NSData *)self->_articleViewingSessionId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v8 = 2654435761 * self->_parentFeedType;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
LABEL_12:
      uint64_t v9 = 2654435761 * self->_subscriptionOnlyArticlePreview;
      goto LABEL_15;
    }
  }
  uint64_t v9 = 0;
LABEL_15:
  uint64_t v22 = v8;
  uint64_t v23 = v7;
  uint64_t v21 = v9;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    NSUInteger v10 = [(NSString *)self->_iadQtoken hash];
  }
  else {
    NSUInteger v10 = [(NSString *)self->_iadQtoken hash];
  }
  NSUInteger v11 = v10;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_paidSubscriptionConversionPointType;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(NSData *)self->_subscriptionPurchaseSessionId hash];
  NSUInteger v14 = [(NSString *)self->_campaignId hash];
  NSUInteger v15 = [(NSString *)self->_campaignType hash];
  NSUInteger v16 = [(NSString *)self->_creativeId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v17 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v17 = 0;
  }
  return v25 ^ v26 ^ v20 ^ v5 ^ v6 ^ v24 ^ v23 ^ v22 ^ v21 ^ v19 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 112);
  if ((v5 & 0x20) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 26);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 112);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_paidSubscriptionSheetViewPresentationReason = *((_DWORD *)v4 + 18);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
LABEL_4:
    self->_uint64_t paidSubscriptionConversionPointExposureLocation = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  id v7 = v4;
  if (*((void *)v4 + 11))
  {
    -[NTPBPaidSubscriptionSheetView setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[NTPBPaidSubscriptionSheetView setSectionId:](self, "setSectionId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBPaidSubscriptionSheetView setArticleId:](self, "setArticleId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBPaidSubscriptionSheetView setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 112);
  if ((v6 & 0x10) != 0)
  {
    self->_uint64_t parentFeedType = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 112);
    if ((v6 & 0x80) == 0)
    {
LABEL_15:
      if ((v6 & 0x40) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x80) == 0)
  {
    goto LABEL_15;
  }
  self->_subscriptionOnlyArticlePreview = *((unsigned char *)v4 + 109);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)v4 + 112) & 0x40) != 0)
  {
LABEL_16:
    self->_arrivedFromAd = *((unsigned char *)v4 + 108);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_17:
  if (*((void *)v4 + 7))
  {
    -[NTPBPaidSubscriptionSheetView setIadQtoken:](self, "setIadQtoken:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 112) & 4) != 0)
  {
    self->_uint64_t paidSubscriptionConversionPointType = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 12))
  {
    -[NTPBPaidSubscriptionSheetView setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBPaidSubscriptionSheetView setCampaignId:](self, "setCampaignId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBPaidSubscriptionSheetView setCampaignType:](self, "setCampaignType:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[NTPBPaidSubscriptionSheetView setCreativeId:](self, "setCreativeId:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 112))
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSString)sectionId
{
  return self->_sectionId;
}

- (void)setSectionId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (BOOL)subscriptionOnlyArticlePreview
{
  return self->_subscriptionOnlyArticlePreview;
}

- (BOOL)arrivedFromAd
{
  return self->_arrivedFromAd;
}

- (NSString)iadQtoken
{
  return self->_iadQtoken;
}

- (void)setIadQtoken:(id)a3
{
}

- (NSData)subscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId;
}

- (void)setSubscriptionPurchaseSessionId:(id)a3
{
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
}

- (NSString)creativeId
{
  return self->_creativeId;
}

- (void)setCreativeId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionPurchaseSessionId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end