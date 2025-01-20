@interface NTPBPaidSubscriptionResult
+ (Class)topicIdsType;
- (BOOL)arrivedFromAd;
- (BOOL)hasAmsPurchaseErrorCode;
- (BOOL)hasArrivedFromAd;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCreativeId;
- (BOOL)hasGroupFeedId;
- (BOOL)hasGroupType;
- (BOOL)hasIadQtoken;
- (BOOL)hasIssueData;
- (BOOL)hasPaidSubscriptionConversionPointType;
- (BOOL)hasParentFeedId;
- (BOOL)hasParentFeedType;
- (BOOL)hasPurchaseId;
- (BOOL)hasPurchaseType;
- (BOOL)hasResultType;
- (BOOL)hasSawSubscriptionSheet;
- (BOOL)hasSectionId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasStorekitError;
- (BOOL)hasSubscriptionOnlyArticlePreview;
- (BOOL)hasSubscriptionPurchaseSessionId;
- (BOOL)hasSurfacedByChannelId;
- (BOOL)hasSurfacedByTopicId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)sawSubscriptionSheet;
- (BOOL)subscriptionOnlyArticlePreview;
- (NSData)articleViewingSessionId;
- (NSData)subscriptionPurchaseSessionId;
- (NSMutableArray)topicIds;
- (NSString)articleId;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)groupFeedId;
- (NSString)iadQtoken;
- (NSString)parentFeedId;
- (NSString)purchaseId;
- (NSString)sectionId;
- (NSString)sourceChannelId;
- (NSString)surfacedByChannelId;
- (NSString)surfacedByTopicId;
- (NTPBIssueData)issueData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupTypeAsString:(int)a3;
- (id)paidSubscriptionConversionPointTypeAsString:(int)a3;
- (id)parentFeedTypeAsString:(int)a3;
- (id)purchaseTypeAsString:(int)a3;
- (id)storekitErrorAsString:(int)a3;
- (id)topicIdsAtIndex:(unint64_t)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsPaidSubscriptionConversionPointType:(id)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)StringAsPurchaseType:(id)a3;
- (int)StringAsStorekitError:(id)a3;
- (int)amsPurchaseErrorCode;
- (int)groupType;
- (int)paidSubscriptionConversionPointType;
- (int)parentFeedType;
- (int)purchaseType;
- (int)resultType;
- (int)storekitError;
- (unint64_t)hash;
- (unint64_t)topicIdsCount;
- (void)addTopicIds:(id)a3;
- (void)clearTopicIds;
- (void)mergeFrom:(id)a3;
- (void)setAmsPurchaseErrorCode:(int)a3;
- (void)setArrivedFromAd:(BOOL)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setHasAmsPurchaseErrorCode:(BOOL)a3;
- (void)setHasArrivedFromAd:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasPurchaseType:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setHasSawSubscriptionSheet:(BOOL)a3;
- (void)setHasStorekitError:(BOOL)a3;
- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setIadQtoken:(id)a3;
- (void)setIssueData:(id)a3;
- (void)setPaidSubscriptionConversionPointType:(int)a3;
- (void)setParentFeedId:(id)a3;
- (void)setParentFeedType:(int)a3;
- (void)setPurchaseId:(id)a3;
- (void)setPurchaseType:(int)a3;
- (void)setResultType:(int)a3;
- (void)setSawSubscriptionSheet:(BOOL)a3;
- (void)setSectionId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setStorekitError:(int)a3;
- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setSubscriptionPurchaseSessionId:(id)a3;
- (void)setSurfacedByChannelId:(id)a3;
- (void)setSurfacedByTopicId:(id)a3;
- (void)setTopicIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPaidSubscriptionResult

- (int)resultType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (void)setResultType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResultType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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

- (int)paidSubscriptionConversionPointType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_paidSubscriptionConversionPointType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
    __int16 v3 = off_26444CEF0[a3];
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

- (int)parentFeedType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_parentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
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
    __int16 v3 = off_26444CFA0[a3];
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
  *(_WORD *)&self->_has |= 0x200u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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

- (BOOL)hasSubscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId != 0;
}

- (void)setSawSubscriptionSheet:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sawSubscriptionSheet = a3;
}

- (void)setHasSawSubscriptionSheet:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSawSubscriptionSheet
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
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
    __int16 v3 = off_26444D050[a3];
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

- (int)storekitError
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_storekitError;
  }
  else {
    return 0;
  }
}

- (void)setStorekitError:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_storekitError = a3;
}

- (void)setHasStorekitError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasStorekitError
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)storekitErrorAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D190[a3];
  }

  return v3;
}

- (int)StringAsStorekitError:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STOREKIT_ERROR"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CLIENT_INVALID_STOREKIT_ERROR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAYMENT_CANCELLED_STOREKIT_ERROR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PAYMENT_INVALID_STOREKIT_ERROR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PAYMENT_NOT_ALLOWED_STOREKIT_ERROR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"STOREPRODUCT_NOT_AVAILABLE_STOREKIT_ERROR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CLOUD_SERVICE_PERMISSION_DENIED_STOREKIT_ERROR"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CLOUD_SERVICE_NETWORK_CONNECTION_FAILED_STOREKIT_ERROR"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CLOUD_SERVICE_REVOKED_STOREKIT_ERROR"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PRIVACY_ACKNOWLEDGEMENT_REQUIRED_STOREKIT_ERROR"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"UNAUTHORIZED_REQUEST_DATA_STOREKIT_ERROR"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"INVALID_OFFER_IDENTIFIER_STOREKIT_ERROR"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"INVALID_OFFER_PRICE_STOREKIT_ERROR"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"INVALID_SIGNATURE_STOREKIT_ERROR"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MISSING_OFFER_PARAMS_STOREKIT_ERROR"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setAmsPurchaseErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_amsPurchaseErrorCode = a3;
}

- (void)setHasAmsPurchaseErrorCode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAmsPurchaseErrorCode
{
  return *(_WORD *)&self->_has & 1;
}

- (void)clearTopicIds
{
}

- (void)addTopicIds:(id)a3
{
  id v4 = a3;
  topicIds = self->_topicIds;
  id v8 = v4;
  if (!topicIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicIds;
    self->_topicIds = v6;

    id v4 = v8;
    topicIds = self->_topicIds;
  }
  [(NSMutableArray *)topicIds addObject:v4];
}

- (unint64_t)topicIdsCount
{
  return [(NSMutableArray *)self->_topicIds count];
}

- (id)topicIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicIds objectAtIndex:a3];
}

+ (Class)topicIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSurfacedByTopicId
{
  return self->_surfacedByTopicId != 0;
}

- (BOOL)hasSurfacedByChannelId
{
  return self->_surfacedByChannelId != 0;
}

- (int)purchaseType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_purchaseType;
  }
  else {
    return 0;
  }
}

- (void)setPurchaseType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_purchaseType = a3;
}

- (void)setHasPurchaseType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPurchaseType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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
    __int16 v3 = off_26444D208[a3];
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
  v8.super_class = (Class)NTPBPaidSubscriptionResult;
  int v4 = [(NTPBPaidSubscriptionResult *)&v8 description];
  v5 = [(NTPBPaidSubscriptionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    int v4 = [NSNumber numberWithInt:self->_resultType];
    [v3 setObject:v4 forKey:@"result_type"];
  }
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
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_26444CEF0[paidSubscriptionConversionPointType];
    }
    [v3 setObject:v21 forKey:@"paid_subscription_conversion_point_type"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 0x200) == 0) {
        goto LABEL_14;
      }
      goto LABEL_65;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_13;
  }
  uint64_t parentFeedType = self->_parentFeedType;
  if (parentFeedType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_26444CFA0[parentFeedType];
  }
  [v3 setObject:v31 forKey:@"parent_feed_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_65:
  v38 = [NSNumber numberWithBool:self->_subscriptionOnlyArticlePreview];
  [v3 setObject:v38 forKey:@"subscription_only_article_preview"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_15:
    v10 = [NSNumber numberWithBool:self->_arrivedFromAd];
    [v3 setObject:v10 forKey:@"arrived_from_ad"];
  }
LABEL_16:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken) {
    [v3 setObject:iadQtoken forKey:@"iad_qtoken"];
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
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if (subscriptionPurchaseSessionId) {
    [v3 setObject:subscriptionPurchaseSessionId forKey:@"subscription_purchase_session_id"];
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x100) != 0)
  {
    v17 = [NSNumber numberWithBool:self->_sawSubscriptionSheet];
    [v3 setObject:v17 forKey:@"saw_subscription_sheet"];

    __int16 v16 = (__int16)self->_has;
  }
  if ((v16 & 2) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_26444D050[groupType];
    }
    [v3 setObject:v19 forKey:@"group_type"];
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
    v26 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"issue_data"];
  }
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 0x40) != 0)
  {
    uint64_t storekitError = self->_storekitError;
    if (storekitError >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_storekitError);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_26444D190[storekitError];
    }
    [v3 setObject:v29 forKey:@"storekit_error"];

    __int16 v27 = (__int16)self->_has;
  }
  if (v27)
  {
    v32 = [NSNumber numberWithInt:self->_amsPurchaseErrorCode];
    [v3 setObject:v32 forKey:@"ams_purchase_error_code"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v3 setObject:topicIds forKey:@"topic_ids"];
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if (surfacedByTopicId) {
    [v3 setObject:surfacedByTopicId forKey:@"surfaced_by_topic_id"];
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId) {
    [v3 setObject:surfacedByChannelId forKey:@"surfaced_by_channel_id"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    uint64_t purchaseType = self->_purchaseType;
    if (purchaseType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_purchaseType);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = off_26444D208[purchaseType];
    }
    [v3 setObject:v37 forKey:@"purchase_type"];
  }
  id v39 = v3;

  return v39;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaidSubscriptionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
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
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 0x200) == 0) {
        goto LABEL_14;
      }
      goto LABEL_58;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_15:
  }
    PBDataWriterWriteBOOLField();
LABEL_16:
  if (self->_iadQtoken) {
    PBDataWriterWriteStringField();
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
  if (self->_subscriptionPurchaseSessionId) {
    PBDataWriterWriteDataField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 2) != 0) {
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
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v7 = (__int16)self->_has;
  }
  if (v7) {
    PBDataWriterWriteInt32Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v8 = self->_topicIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if (self->_surfacedByTopicId) {
    PBDataWriterWriteStringField();
  }
  if (self->_surfacedByChannelId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_resultType;
    *(_WORD *)(v5 + 188) |= 0x20u;
  }
  uint64_t v7 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v7;

  uint64_t v9 = [(NSString *)self->_sectionId copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v9;

  uint64_t v11 = [(NSString *)self->_articleId copyWithZone:a3];
  v12 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v11;

  uint64_t v13 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  long long v14 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v13;

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_paidSubscriptionConversionPointType;
    *(_WORD *)(v6 + 188) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_28;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 104) = self->_parentFeedType;
  *(_WORD *)(v6 + 188) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_28:
  *(unsigned char *)(v6 + 186) = self->_subscriptionOnlyArticlePreview;
  *(_WORD *)(v6 + 188) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    *(unsigned char *)(v6 + 184) = self->_arrivedFromAd;
    *(_WORD *)(v6 + 188) |= 0x80u;
  }
LABEL_8:
  uint64_t v16 = [(NSString *)self->_iadQtoken copyWithZone:a3];
  v17 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v16;

  uint64_t v18 = [(NSString *)self->_campaignId copyWithZone:a3];
  v19 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v18;

  uint64_t v20 = [(NSString *)self->_campaignType copyWithZone:a3];
  v21 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v20;

  uint64_t v22 = [(NSString *)self->_creativeId copyWithZone:a3];
  v23 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v22;

  uint64_t v24 = [(NSData *)self->_subscriptionPurchaseSessionId copyWithZone:a3];
  v25 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v24;

  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x100) != 0)
  {
    *(unsigned char *)(v6 + 185) = self->_sawSubscriptionSheet;
    *(_WORD *)(v6 + 188) |= 0x100u;
    __int16 v26 = (__int16)self->_has;
  }
  if ((v26 & 2) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_groupType;
    *(_WORD *)(v6 + 188) |= 2u;
  }
  uint64_t v27 = [(NSString *)self->_purchaseId copyWithZone:a3];
  v28 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v27;

  uint64_t v29 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  v30 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v29;

  uint64_t v31 = [(NSString *)self->_parentFeedId copyWithZone:a3];
  v32 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v31;

  id v33 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v34 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v33;

  __int16 v35 = (__int16)self->_has;
  if ((v35 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_storekitError;
    *(_WORD *)(v6 + 188) |= 0x40u;
    __int16 v35 = (__int16)self->_has;
  }
  if (v35)
  {
    *(_DWORD *)(v6 + 8) = self->_amsPurchaseErrorCode;
    *(_WORD *)(v6 + 188) |= 1u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v36 = self->_topicIds;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v48 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "copyWithZone:", a3, (void)v47);
        [(id)v6 addTopicIds:v41];
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v38);
  }

  uint64_t v42 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  v43 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v42;

  uint64_t v44 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  v45 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v44;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 120) = self->_purchaseType;
    *(_WORD *)(v6 + 188) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_93;
  }
  __int16 v5 = *((_WORD *)v4 + 94);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v5 & 0x20) == 0 || self->_resultType != *((_DWORD *)v4 + 31)) {
      goto LABEL_93;
    }
  }
  else if ((v5 & 0x20) != 0)
  {
    goto LABEL_93;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 17)
    && !-[NSString isEqual:](sourceChannelId, "isEqual:"))
  {
    goto LABEL_93;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 94);
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 22)) {
      goto LABEL_93;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 26)) {
      goto LABEL_93;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x200) == 0) {
      goto LABEL_93;
    }
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((unsigned char *)v4 + 186)) {
        goto LABEL_93;
      }
    }
    else if (*((unsigned char *)v4 + 186))
    {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0) {
      goto LABEL_93;
    }
    if (self->_arrivedFromAd)
    {
      if (!*((unsigned char *)v4 + 184)) {
        goto LABEL_93;
      }
    }
    else if (*((unsigned char *)v4 + 184))
    {
      goto LABEL_93;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  iadQtoken = self->_iadQtoken;
  if ((unint64_t)iadQtoken | *((void *)v4 + 9) && !-[NSString isEqual:](iadQtoken, "isEqual:")) {
    goto LABEL_93;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_93;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((void *)v4 + 19))
  {
    if (!-[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  __int16 v17 = (__int16)self->_has;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v17 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x100) != 0)
    {
      if (self->_sawSubscriptionSheet)
      {
        if (!*((unsigned char *)v4 + 185)) {
          goto LABEL_93;
        }
        goto LABEL_59;
      }
      if (!*((unsigned char *)v4 + 185)) {
        goto LABEL_59;
      }
    }
LABEL_93:
    BOOL v29 = 0;
    goto LABEL_94;
  }
  if ((*((_WORD *)v4 + 94) & 0x100) != 0) {
    goto LABEL_93;
  }
LABEL_59:
  if ((v17 & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_groupType != *((_DWORD *)v4 + 16)) {
      goto LABEL_93;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_93;
  }
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((void *)v4 + 14)
    && !-[NSString isEqual:](purchaseId, "isEqual:"))
  {
    goto LABEL_93;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](parentFeedId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 10))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_93;
    }
  }
  __int16 v23 = (__int16)self->_has;
  __int16 v24 = *((_WORD *)v4 + 94);
  if ((v23 & 0x40) != 0)
  {
    if ((v24 & 0x40) == 0 || self->_storekitError != *((_DWORD *)v4 + 36)) {
      goto LABEL_93;
    }
  }
  else if ((v24 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if (v23)
  {
    if ((v24 & 1) == 0 || self->_amsPurchaseErrorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_93;
    }
  }
  else if (v24)
  {
    goto LABEL_93;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 22)
    && !-[NSMutableArray isEqual:](topicIds, "isEqual:"))
  {
    goto LABEL_93;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](surfacedByChannelId, "isEqual:")) {
      goto LABEL_93;
    }
  }
  __int16 v28 = *((_WORD *)v4 + 94);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v28 & 0x10) == 0 || self->_purchaseType != *((_DWORD *)v4 + 30)) {
      goto LABEL_93;
    }
    BOOL v29 = 1;
  }
  else
  {
    BOOL v29 = (v28 & 0x10) == 0;
  }
LABEL_94:

  return v29;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v32 = 2654435761 * self->_resultType;
  }
  else {
    uint64_t v32 = 0;
  }
  NSUInteger v31 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v30 = [(NSString *)self->_sectionId hash];
  NSUInteger v29 = [(NSString *)self->_articleId hash];
  uint64_t v28 = [(NSData *)self->_articleViewingSessionId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v27 = 2654435761 * self->_paidSubscriptionConversionPointType;
    if ((has & 8) != 0)
    {
LABEL_6:
      uint64_t v26 = 2654435761 * self->_parentFeedType;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v25 = 0;
      if ((has & 0x80) != 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v26 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v25 = 2654435761 * self->_subscriptionOnlyArticlePreview;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v24 = 2654435761 * self->_arrivedFromAd;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v24 = 0;
LABEL_13:
  NSUInteger v23 = [(NSString *)self->_iadQtoken hash];
  NSUInteger v22 = [(NSString *)self->_campaignId hash];
  NSUInteger v21 = [(NSString *)self->_campaignType hash];
  NSUInteger v20 = [(NSString *)self->_creativeId hash];
  uint64_t v19 = [(NSData *)self->_subscriptionPurchaseSessionId hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x100) != 0)
  {
    uint64_t v18 = 2654435761 * self->_sawSubscriptionSheet;
    if ((v4 & 2) != 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((v4 & 2) != 0)
    {
LABEL_15:
      uint64_t v17 = 2654435761 * self->_groupType;
      goto LABEL_18;
    }
  }
  uint64_t v17 = 0;
LABEL_18:
  NSUInteger v16 = [(NSString *)self->_purchaseId hash];
  NSUInteger v5 = [(NSString *)self->_groupFeedId hash];
  NSUInteger v6 = [(NSString *)self->_parentFeedId hash];
  unint64_t v7 = [(NTPBIssueData *)self->_issueData hash];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    uint64_t v9 = 2654435761 * self->_storekitError;
    if (v8) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v8)
    {
LABEL_20:
      uint64_t v10 = 2654435761 * self->_amsPurchaseErrorCode;
      goto LABEL_23;
    }
  }
  uint64_t v10 = 0;
LABEL_23:
  uint64_t v11 = [(NSMutableArray *)self->_topicIds hash];
  NSUInteger v12 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v13 = [(NSString *)self->_surfacedByChannelId hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v14 = 2654435761 * self->_purchaseType;
  }
  else {
    uint64_t v14 = 0;
  }
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  __int16 v4 = a3;
  id v5 = v4;
  if ((v4[47] & 0x20) != 0)
  {
    self->_resultType = v4[31];
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 17)) {
    -[NTPBPaidSubscriptionResult setSourceChannelId:](self, "setSourceChannelId:");
  }
  if (*((void *)v5 + 16)) {
    -[NTPBPaidSubscriptionResult setSectionId:](self, "setSectionId:");
  }
  if (*((void *)v5 + 2)) {
    -[NTPBPaidSubscriptionResult setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 3)) {
    -[NTPBPaidSubscriptionResult setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  __int16 v6 = *((_WORD *)v5 + 94);
  if ((v6 & 4) != 0)
  {
    self->_uint64_t paidSubscriptionConversionPointType = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 4u;
    __int16 v6 = *((_WORD *)v5 + 94);
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 0x200) == 0) {
        goto LABEL_14;
      }
      goto LABEL_41;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_uint64_t parentFeedType = *((_DWORD *)v5 + 26);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v5 + 94);
  if ((v6 & 0x200) == 0)
  {
LABEL_14:
    if ((v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_41:
  self->_subscriptionOnlyArticlePreview = *((unsigned char *)v5 + 186);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v5 + 94) & 0x80) != 0)
  {
LABEL_15:
    self->_arrivedFromAd = *((unsigned char *)v5 + 184);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_16:
  if (*((void *)v5 + 9)) {
    -[NTPBPaidSubscriptionResult setIadQtoken:](self, "setIadQtoken:");
  }
  if (*((void *)v5 + 4)) {
    -[NTPBPaidSubscriptionResult setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBPaidSubscriptionResult setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v5 + 6)) {
    -[NTPBPaidSubscriptionResult setCreativeId:](self, "setCreativeId:");
  }
  if (*((void *)v5 + 19)) {
    -[NTPBPaidSubscriptionResult setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
  }
  __int16 v7 = *((_WORD *)v5 + 94);
  if ((v7 & 0x100) != 0)
  {
    self->_sawSubscriptionSheet = *((unsigned char *)v5 + 185);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v7 = *((_WORD *)v5 + 94);
  }
  if ((v7 & 2) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v5 + 16);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 14)) {
    -[NTPBPaidSubscriptionResult setPurchaseId:](self, "setPurchaseId:");
  }
  if (*((void *)v5 + 7)) {
    -[NTPBPaidSubscriptionResult setGroupFeedId:](self, "setGroupFeedId:");
  }
  if (*((void *)v5 + 12)) {
    -[NTPBPaidSubscriptionResult setParentFeedId:](self, "setParentFeedId:");
  }
  issueData = self->_issueData;
  uint64_t v9 = *((void *)v5 + 10);
  if (issueData)
  {
    if (v9) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[NTPBPaidSubscriptionResult setIssueData:](self, "setIssueData:");
  }
  __int16 v10 = *((_WORD *)v5 + 94);
  if ((v10 & 0x40) != 0)
  {
    self->_uint64_t storekitError = *((_DWORD *)v5 + 36);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v10 = *((_WORD *)v5 + 94);
  }
  if (v10)
  {
    self->_amsPurchaseErrorCode = *((_DWORD *)v5 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 22);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[NTPBPaidSubscriptionResult addTopicIds:](self, "addTopicIds:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  if (*((void *)v5 + 21)) {
    -[NTPBPaidSubscriptionResult setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v5 + 20)) {
    -[NTPBPaidSubscriptionResult setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if ((*((_WORD *)v5 + 94) & 0x10) != 0)
  {
    self->_uint64_t purchaseType = *((_DWORD *)v5 + 30);
    *(_WORD *)&self->_has |= 0x10u;
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

- (NSData)subscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId;
}

- (void)setSubscriptionPurchaseSessionId:(id)a3
{
}

- (BOOL)sawSubscriptionSheet
{
  return self->_sawSubscriptionSheet;
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

- (int)amsPurchaseErrorCode
{
  return self->_amsPurchaseErrorCode;
}

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
}

- (NSString)surfacedByTopicId
{
  return self->_surfacedByTopicId;
}

- (void)setSurfacedByTopicId:(id)a3
{
}

- (NSString)surfacedByChannelId
{
  return self->_surfacedByChannelId;
}

- (void)setSurfacedByChannelId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_subscriptionPurchaseSessionId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_purchaseId, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end