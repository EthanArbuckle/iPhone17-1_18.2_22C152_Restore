@interface NTPBPaidSubscriptionConversionPointExposure
- (BOOL)arrivedFromAd;
- (BOOL)hasArrivedFromAd;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasGroupFeedId;
- (BOOL)hasGroupType;
- (BOOL)hasIadQtoken;
- (BOOL)hasIssueData;
- (BOOL)hasPaidSubscriptionConversionPointExposureLocation;
- (BOOL)hasPaidSubscriptionConversionPointExposurePresentationReason;
- (BOOL)hasPaidSubscriptionConversionPointType;
- (BOOL)hasParentFeedId;
- (BOOL)hasParentFeedType;
- (BOOL)hasPurchaseId;
- (BOOL)hasPurchaseType;
- (BOOL)hasSectionId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSubscriptionOnlyArticlePreview;
- (BOOL)hasSubscriptionPurchaseSessionId;
- (BOOL)hasUserAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)subscriptionOnlyArticlePreview;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSData)subscriptionPurchaseSessionId;
- (NSString)articleId;
- (NSString)groupFeedId;
- (NSString)iadQtoken;
- (NSString)parentFeedId;
- (NSString)purchaseId;
- (NSString)sectionId;
- (NSString)sourceChannelId;
- (NTPBIssueData)issueData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupTypeAsString:(int)a3;
- (id)paidSubscriptionConversionPointExposureLocationAsString:(int)a3;
- (id)paidSubscriptionConversionPointTypeAsString:(int)a3;
- (id)parentFeedTypeAsString:(int)a3;
- (id)purchaseTypeAsString:(int)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsPaidSubscriptionConversionPointExposureLocation:(id)a3;
- (int)StringAsPaidSubscriptionConversionPointType:(id)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)StringAsPurchaseType:(id)a3;
- (int)groupType;
- (int)paidSubscriptionConversionPointExposureLocation;
- (int)paidSubscriptionConversionPointExposurePresentationReason;
- (int)paidSubscriptionConversionPointType;
- (int)parentFeedType;
- (int)purchaseType;
- (int)userAction;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArrivedFromAd:(BOOL)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setHasArrivedFromAd:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointExposureLocation:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointExposurePresentationReason:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasPurchaseType:(BOOL)a3;
- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setIadQtoken:(id)a3;
- (void)setIssueData:(id)a3;
- (void)setPaidSubscriptionConversionPointExposureLocation:(int)a3;
- (void)setPaidSubscriptionConversionPointExposurePresentationReason:(int)a3;
- (void)setPaidSubscriptionConversionPointType:(int)a3;
- (void)setParentFeedId:(id)a3;
- (void)setParentFeedType:(int)a3;
- (void)setPurchaseId:(id)a3;
- (void)setPurchaseType:(int)a3;
- (void)setSectionId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setSubscriptionPurchaseSessionId:(id)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPaidSubscriptionConversionPointExposure

- (int)paidSubscriptionConversionPointType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_paidSubscriptionConversionPointType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D4E0[a3];
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

- (int)userAction
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasUserAction
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)paidSubscriptionConversionPointExposureLocation
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_paidSubscriptionConversionPointExposureLocation;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointExposureLocation:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_paidSubscriptionConversionPointExposureLocation = a3;
}

- (void)setHasPaidSubscriptionConversionPointExposureLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointExposureLocation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)paidSubscriptionConversionPointExposureLocationAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D590[a3];
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

- (int)paidSubscriptionConversionPointExposurePresentationReason
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_paidSubscriptionConversionPointExposurePresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointExposurePresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_paidSubscriptionConversionPointExposurePresentationReason = a3;
}

- (void)setHasPaidSubscriptionConversionPointExposurePresentationReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointExposurePresentationReason
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_parentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D5A8[a3];
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
  *(_WORD *)&self->_has |= 0x100u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setArrivedFromAd:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_arrivedFromAd = a3;
}

- (void)setHasArrivedFromAd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasArrivedFromAd
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasIadQtoken
{
  return self->_iadQtoken != 0;
}

- (BOOL)hasSubscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (int)groupType
{
  if (*(_WORD *)&self->_has) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasGroupType
{
  return *(_WORD *)&self->_has & 1;
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
    __int16 v3 = off_26444D658[a3];
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

- (BOOL)hasPurchaseId
{
  return self->_purchaseId != 0;
}

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (int)purchaseType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_purchaseType;
  }
  else {
    return 0;
  }
}

- (void)setPurchaseType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_purchaseType = a3;
}

- (void)setHasPurchaseType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPurchaseType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)purchaseTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D798[a3];
  }

  return v3;
}

- (int)StringAsPurchaseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PURCHASE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AL_A_CARTE_PURCHASE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUNDLE_PURCHASE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"S_BUNDLE_PURCHASE_TYPE"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)NTPBPaidSubscriptionConversionPointExposure;
  int v4 = [(NTPBPaidSubscriptionConversionPointExposure *)&v8 description];
  v5 = [(NTPBPaidSubscriptionConversionPointExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_26444D4E0[paidSubscriptionConversionPointType];
    }
    [v3 setObject:v6 forKey:@"paid_subscription_conversion_point_type"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v7 forKey:@"user_action"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 2) != 0)
  {
    uint64_t paidSubscriptionConversionPointExposureLocation = self->_paidSubscriptionConversionPointExposureLocation;
    if (paidSubscriptionConversionPointExposureLocation >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointExposureLocation);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_26444D590[paidSubscriptionConversionPointExposureLocation];
    }
    [v3 setObject:v11 forKey:@"paid_subscription_conversion_point_exposure_location"];

    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 4) != 0)
  {
    v12 = [NSNumber numberWithInt:self->_paidSubscriptionConversionPointExposurePresentationReason];
    [v3 setObject:v12 forKey:@"paid_subscription_conversion_point_exposure_presentation_reason"];
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
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x10) != 0)
  {
    uint64_t parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_26444D5A8[parentFeedType];
    }
    [v3 setObject:v24 forKey:@"parent_feed_type"];

    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x100) == 0)
    {
LABEL_25:
      if ((v16 & 0x80) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_25;
  }
  v32 = [NSNumber numberWithBool:self->_subscriptionOnlyArticlePreview];
  [v3 setObject:v32 forKey:@"subscription_only_article_preview"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_26:
    v17 = [NSNumber numberWithBool:self->_arrivedFromAd];
    [v3 setObject:v17 forKey:@"arrived_from_ad"];
  }
LABEL_27:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken) {
    [v3 setObject:iadQtoken forKey:@"iad_qtoken"];
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if (subscriptionPurchaseSessionId) {
    [v3 setObject:subscriptionPurchaseSessionId forKey:@"subscription_purchase_session_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  if (*(_WORD *)&self->_has)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_26444D658[groupType];
    }
    [v3 setObject:v22 forKey:@"group_type"];
  }
  purchaseId = self->_purchaseId;
  if (purchaseId) {
    [v3 setObject:purchaseId forKey:@"purchase_id"];
  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v3 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  parentFeedId = self->_parentFeedId;
  if (parentFeedId) {
    [v3 setObject:parentFeedId forKey:@"parent_feed_id"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v29 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"issue_data"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    uint64_t purchaseType = self->_purchaseType;
    if (purchaseType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_purchaseType);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_26444D798[purchaseType];
    }
    [v3 setObject:v31 forKey:@"purchase_type"];
  }
  id v33 = v3;

  return v33;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaidSubscriptionConversionPointExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 4) != 0) {
    PBDataWriterWriteInt32Field();
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
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x100) == 0)
    {
LABEL_19:
      if ((v6 & 0x80) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_20:
  }
    PBDataWriterWriteBOOLField();
LABEL_21:
  if (self->_iadQtoken) {
    PBDataWriterWriteStringField();
  }
  if (self->_subscriptionPurchaseSessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_purchaseId) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentFeedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_issueData) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_paidSubscriptionConversionPointType;
    *(_WORD *)(v5 + 144) |= 8u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_userAction;
    *(_WORD *)(v5 + 144) |= 0x40u;
  }
  uint64_t v8 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  __int16 v9 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 2) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_paidSubscriptionConversionPointExposureLocation;
    *(_WORD *)(v6 + 144) |= 2u;
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 4) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_paidSubscriptionConversionPointExposurePresentationReason;
    *(_WORD *)(v6 + 144) |= 4u;
  }
  uint64_t v11 = [(NSString *)self->_sectionId copyWithZone:a3];
  v12 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v11;

  uint64_t v13 = [(NSString *)self->_articleId copyWithZone:a3];
  v14 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v13;

  uint64_t v15 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  __int16 v16 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_parentFeedType;
    *(_WORD *)(v6 + 144) |= 0x10u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 0x100) == 0)
    {
LABEL_11:
      if ((v17 & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  *(unsigned char *)(v6 + 141) = self->_subscriptionOnlyArticlePreview;
  *(_WORD *)(v6 + 144) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_12:
    *(unsigned char *)(v6 + 140) = self->_arrivedFromAd;
    *(_WORD *)(v6 + 144) |= 0x80u;
  }
LABEL_13:
  uint64_t v18 = [(NSString *)self->_iadQtoken copyWithZone:a3];
  v19 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v18;

  uint64_t v20 = [(NSData *)self->_subscriptionPurchaseSessionId copyWithZone:a3];
  v21 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v20;

  uint64_t v22 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v23 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v22;

  if (*(_WORD *)&self->_has)
  {
    *(_DWORD *)(v6 + 40) = self->_groupType;
    *(_WORD *)(v6 + 144) |= 1u;
  }
  uint64_t v24 = [(NSString *)self->_purchaseId copyWithZone:a3];
  v25 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v24;

  uint64_t v26 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  v27 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v26;

  uint64_t v28 = [(NSString *)self->_parentFeedId copyWithZone:a3];
  v29 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v28;

  id v30 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v31 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v30;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_purchaseType;
    *(_WORD *)(v6 + 144) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_76;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 72);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 18)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_userAction != *((_DWORD *)v4 + 34)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_76;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_76;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 72);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_paidSubscriptionConversionPointExposureLocation != *((_DWORD *)v4 + 16)) {
      goto LABEL_76;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_paidSubscriptionConversionPointExposurePresentationReason != *((_DWORD *)v4 + 17)) {
      goto LABEL_76;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_76;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((void *)v4 + 14) && !-[NSString isEqual:](sectionId, "isEqual:")) {
    goto LABEL_76;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_76;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_76;
    }
  }
  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 72);
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 22)) {
      goto LABEL_76;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x100) == 0) {
      goto LABEL_76;
    }
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((unsigned char *)v4 + 141)) {
        goto LABEL_76;
      }
    }
    else if (*((unsigned char *)v4 + 141))
    {
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x100) != 0)
  {
    goto LABEL_76;
  }
  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) != 0)
    {
      if (self->_arrivedFromAd)
      {
        if (!*((unsigned char *)v4 + 140)) {
          goto LABEL_76;
        }
        goto LABEL_52;
      }
      if (!*((unsigned char *)v4 + 140)) {
        goto LABEL_52;
      }
    }
LABEL_76:
    BOOL v23 = 0;
    goto LABEL_77;
  }
  if ((v13 & 0x80) != 0) {
    goto LABEL_76;
  }
LABEL_52:
  iadQtoken = self->_iadQtoken;
  if ((unint64_t)iadQtoken | *((void *)v4 + 6) && !-[NSString isEqual:](iadQtoken, "isEqual:")) {
    goto LABEL_76;
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((void *)v4 + 16))
  {
    if (!-[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:")) {
      goto LABEL_76;
    }
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_76;
    }
  }
  __int16 v17 = *((_WORD *)v4 + 72);
  if (*(_WORD *)&self->_has)
  {
    if ((v17 & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 10)) {
      goto LABEL_76;
    }
  }
  else if (v17)
  {
    goto LABEL_76;
  }
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((void *)v4 + 12)
    && !-[NSString isEqual:](purchaseId, "isEqual:"))
  {
    goto LABEL_76;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:")) {
      goto LABEL_76;
    }
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](parentFeedId, "isEqual:")) {
      goto LABEL_76;
    }
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 7))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_76;
    }
  }
  __int16 v22 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v22 & 0x20) == 0 || self->_purchaseType != *((_DWORD *)v4 + 26)) {
      goto LABEL_76;
    }
    BOOL v23 = 1;
  }
  else
  {
    BOOL v23 = (v22 & 0x20) == 0;
  }
LABEL_77:

  return v23;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v26 = 2654435761 * self->_paidSubscriptionConversionPointType;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v25 = 2654435761 * self->_userAction;
      goto LABEL_6;
    }
  }
  uint64_t v25 = 0;
LABEL_6:
  NSUInteger v24 = [(NSString *)self->_sourceChannelId hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 2) != 0)
  {
    uint64_t v23 = 2654435761 * self->_paidSubscriptionConversionPointExposureLocation;
    if ((v4 & 4) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((v4 & 4) != 0)
    {
LABEL_8:
      uint64_t v22 = 2654435761 * self->_paidSubscriptionConversionPointExposurePresentationReason;
      goto LABEL_11;
    }
  }
  uint64_t v22 = 0;
LABEL_11:
  NSUInteger v21 = [(NSString *)self->_sectionId hash];
  NSUInteger v20 = [(NSString *)self->_articleId hash];
  uint64_t v19 = [(NSData *)self->_articleViewingSessionId hash];
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
    uint64_t v18 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v17 = 0;
    if ((v5 & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  uint64_t v18 = 2654435761 * self->_parentFeedType;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v17 = 2654435761 * self->_subscriptionOnlyArticlePreview;
  if ((v5 & 0x80) != 0)
  {
LABEL_14:
    uint64_t v16 = 2654435761 * self->_arrivedFromAd;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v16 = 0;
LABEL_18:
  NSUInteger v6 = [(NSString *)self->_iadQtoken hash];
  uint64_t v7 = [(NSData *)self->_subscriptionPurchaseSessionId hash];
  uint64_t v8 = [(NSData *)self->_feedViewExposureId hash];
  if (*(_WORD *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_purchaseId hash];
  NSUInteger v11 = [(NSString *)self->_groupFeedId hash];
  NSUInteger v12 = [(NSString *)self->_parentFeedId hash];
  unint64_t v13 = [(NTPBIssueData *)self->_issueData hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v14 = 2654435761 * self->_purchaseType;
  }
  else {
    uint64_t v14 = 0;
  }
  return v25 ^ v26 ^ v23 ^ v22 ^ v24 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v4 = (int *)a3;
  __int16 v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 72);
  if ((v6 & 8) != 0)
  {
    self->_uint64_t paidSubscriptionConversionPointType = v4[18];
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 72);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_userAction = v4[34];
    *(_WORD *)&self->_has |= 0x40u;
  }
  NSUInteger v11 = v4;
  if (*((void *)v4 + 15))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setSourceChannelId:](self, "setSourceChannelId:");
    __int16 v5 = v11;
  }
  __int16 v7 = *((_WORD *)v5 + 72);
  if ((v7 & 2) != 0)
  {
    self->_uint64_t paidSubscriptionConversionPointExposureLocation = v5[16];
    *(_WORD *)&self->_has |= 2u;
    __int16 v7 = *((_WORD *)v5 + 72);
  }
  if ((v7 & 4) != 0)
  {
    self->_paidSubscriptionConversionPointExposurePresentationReason = v5[17];
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 14))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setSectionId:](self, "setSectionId:");
    __int16 v5 = v11;
  }
  if (*((void *)v5 + 1))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setArticleId:](self, "setArticleId:");
    __int16 v5 = v11;
  }
  if (*((void *)v5 + 2))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    __int16 v5 = v11;
  }
  __int16 v8 = *((_WORD *)v5 + 72);
  if ((v8 & 0x10) != 0)
  {
    self->_uint64_t parentFeedType = v5[22];
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v8 = *((_WORD *)v5 + 72);
    if ((v8 & 0x100) == 0)
    {
LABEL_19:
      if ((v8 & 0x80) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((v5[36] & 0x100) == 0)
  {
    goto LABEL_19;
  }
  self->_subscriptionOnlyArticlePreview = *((unsigned char *)v5 + 141);
  *(_WORD *)&self->_has |= 0x100u;
  if ((v5[36] & 0x80) != 0)
  {
LABEL_20:
    self->_arrivedFromAd = *((unsigned char *)v5 + 140);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_21:
  if (*((void *)v5 + 6))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setIadQtoken:](self, "setIadQtoken:");
    __int16 v5 = v11;
  }
  if (*((void *)v5 + 16))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
    __int16 v5 = v11;
  }
  if (*((void *)v5 + 3))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    __int16 v5 = v11;
  }
  if (v5[36])
  {
    self->_uint64_t groupType = v5[10];
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 12))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setPurchaseId:](self, "setPurchaseId:");
    __int16 v5 = v11;
  }
  if (*((void *)v5 + 4))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setGroupFeedId:](self, "setGroupFeedId:");
    __int16 v5 = v11;
  }
  if (*((void *)v5 + 10))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setParentFeedId:](self, "setParentFeedId:");
    __int16 v5 = v11;
  }
  issueData = self->_issueData;
  uint64_t v10 = *((void *)v5 + 7);
  if (issueData)
  {
    if (!v10) {
      goto LABEL_44;
    }
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_44;
    }
    -[NTPBPaidSubscriptionConversionPointExposure setIssueData:](self, "setIssueData:");
  }
  __int16 v5 = v11;
LABEL_44:
  if ((v5[36] & 0x20) != 0)
  {
    self->_uint64_t purchaseType = v5[26];
    *(_WORD *)&self->_has |= 0x20u;
  }

  MEMORY[0x270F9A758]();
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

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (NSString)purchaseId
{
  return self->_purchaseId;
}

- (void)setPurchaseId:(id)a3
{
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionPurchaseSessionId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_purchaseId, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end