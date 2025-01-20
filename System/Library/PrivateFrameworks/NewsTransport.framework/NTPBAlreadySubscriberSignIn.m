@interface NTPBAlreadySubscriberSignIn
+ (Class)topicIdsType;
- (BOOL)arrivedFromAd;
- (BOOL)hasArrivedFromAd;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCreativeId;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorMessage;
- (BOOL)hasGroupType;
- (BOOL)hasIadQtoken;
- (BOOL)hasIssueData;
- (BOOL)hasPaidSubscriptionConversionPointType;
- (BOOL)hasParentFeedType;
- (BOOL)hasSectionId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSubscriptionOnlyArticlePreview;
- (BOOL)hasSubscriptionPurchaseSessionId;
- (BOOL)hasSuccessfulNewsTokenVerification;
- (BOOL)hasSurfacedByChannelId;
- (BOOL)hasSurfacedByTopicId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)subscriptionOnlyArticlePreview;
- (BOOL)successfulNewsTokenVerification;
- (NSData)articleViewingSessionId;
- (NSData)subscriptionPurchaseSessionId;
- (NSMutableArray)topicIds;
- (NSString)articleId;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)errorCode;
- (NSString)errorMessage;
- (NSString)iadQtoken;
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
- (id)topicIdsAtIndex:(unint64_t)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsPaidSubscriptionConversionPointType:(id)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)groupType;
- (int)paidSubscriptionConversionPointType;
- (int)parentFeedType;
- (unint64_t)hash;
- (unint64_t)topicIdsCount;
- (void)addTopicIds:(id)a3;
- (void)clearTopicIds;
- (void)mergeFrom:(id)a3;
- (void)setArrivedFromAd:(BOOL)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setHasArrivedFromAd:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setHasSuccessfulNewsTokenVerification:(BOOL)a3;
- (void)setIadQtoken:(id)a3;
- (void)setIssueData:(id)a3;
- (void)setPaidSubscriptionConversionPointType:(int)a3;
- (void)setParentFeedType:(int)a3;
- (void)setSectionId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setSubscriptionPurchaseSessionId:(id)a3;
- (void)setSuccessfulNewsTokenVerification:(BOOL)a3;
- (void)setSurfacedByChannelId:(id)a3;
- (void)setSurfacedByTopicId:(id)a3;
- (void)setTopicIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAlreadySubscriberSignIn

- (void)setSuccessfulNewsTokenVerification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_successfulNewsTokenVerification = a3;
}

- (void)setHasSuccessfulNewsTokenVerification:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSuccessfulNewsTokenVerification
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (int)paidSubscriptionConversionPointType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_paidSubscriptionConversionPointType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
    char v3 = off_26444B880[a3];
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

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_parentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setParentFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
    char v3 = off_26444B930[a3];
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
  *(unsigned char *)&self->_has |= 0x10u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setArrivedFromAd:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_arrivedFromAd = a3;
}

- (void)setHasArrivedFromAd:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasArrivedFromAd
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasIadQtoken
{
  return self->_iadQtoken != 0;
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
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444B9E0[a3];
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

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAlreadySubscriberSignIn;
  id v4 = [(NTPBAlreadySubscriberSignIn *)&v8 description];
  v5 = [(NTPBAlreadySubscriberSignIn *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_successfulNewsTokenVerification];
    [v3 setObject:v5 forKey:@"successful_news_token_verification"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_26444B880[paidSubscriptionConversionPointType];
    }
    [v3 setObject:v7 forKey:@"paid_subscription_conversion_point_type"];
  }
  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"error_message"];
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    [v3 setObject:errorCode forKey:@"error_code"];
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
  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    uint64_t parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_26444B930[parentFeedType];
    }
    [v3 setObject:v24 forKey:@"parent_feed_type"];

    char v14 = (char)self->_has;
    if ((v14 & 0x10) == 0)
    {
LABEL_22:
      if ((v14 & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_22;
  }
  v32 = [NSNumber numberWithBool:self->_subscriptionOnlyArticlePreview];
  [v3 setObject:v32 forKey:@"subscription_only_article_preview"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_23:
    v15 = [NSNumber numberWithBool:self->_arrivedFromAd];
    [v3 setObject:v15 forKey:@"arrived_from_ad"];
  }
LABEL_24:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken) {
    [v3 setObject:iadQtoken forKey:@"iad_qtoken"];
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
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_26444B9E0[groupType];
    }
    [v3 setObject:v22 forKey:@"group_type"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v26 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"issue_data"];
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
  id v30 = v3;

  return v30;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAlreadySubscriberSignInReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_errorMessage) {
    PBDataWriterWriteStringField();
  }
  if (self->_errorCode) {
    PBDataWriterWriteStringField();
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
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_19:
      if ((v6 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
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
  if (self->_issueData) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_topicIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (self->_surfacedByTopicId) {
    PBDataWriterWriteStringField();
  }
  if (self->_surfacedByChannelId) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 146) = self->_successfulNewsTokenVerification;
    *(unsigned char *)(v5 + 148) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_paidSubscriptionConversionPointType;
    *(unsigned char *)(v5 + 148) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_errorMessage copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_errorCode copyWithZone:a3];
  v11 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  long long v13 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v12;

  uint64_t v14 = [(NSString *)self->_sectionId copyWithZone:a3];
  long long v15 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v14;

  uint64_t v16 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v16;

  uint64_t v18 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v19 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v18;

  char v20 = (char)self->_has;
  if ((v20 & 4) != 0)
  {
    *(_DWORD *)(v6 + 92) = self->_parentFeedType;
    *(unsigned char *)(v6 + 148) |= 4u;
    char v20 = (char)self->_has;
    if ((v20 & 0x10) == 0)
    {
LABEL_7:
      if ((v20 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v6 + 145) = self->_subscriptionOnlyArticlePreview;
  *(unsigned char *)(v6 + 148) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 144) = self->_arrivedFromAd;
    *(unsigned char *)(v6 + 148) |= 8u;
  }
LABEL_9:
  uint64_t v21 = [(NSString *)self->_iadQtoken copyWithZone:a3];
  v22 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v21;

  uint64_t v23 = [(NSData *)self->_subscriptionPurchaseSessionId copyWithZone:a3];
  v24 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v23;

  uint64_t v25 = [(NSString *)self->_campaignId copyWithZone:a3];
  v26 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v25;

  uint64_t v27 = [(NSString *)self->_campaignType copyWithZone:a3];
  v28 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v27;

  uint64_t v29 = [(NSString *)self->_creativeId copyWithZone:a3];
  id v30 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v29;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 64) = self->_groupType;
    *(unsigned char *)(v6 + 148) |= 1u;
  }
  id v31 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v32 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v31;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v33 = self->_topicIds;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "copyWithZone:", a3, (void)v44);
        [(id)v6 addTopicIds:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v35);
  }

  uint64_t v39 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  v40 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v39;

  uint64_t v41 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  v42 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v41;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 0x20) == 0) {
      goto LABEL_71;
    }
    if (self->_successfulNewsTokenVerification)
    {
      if (!*((unsigned char *)v4 + 146)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 146))
    {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 2) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 22)) {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 2) != 0)
  {
    goto LABEL_71;
  }
  errorMessage = self->_errorMessage;
  if ((unint64_t)errorMessage | *((void *)v4 + 7)
    && !-[NSString isEqual:](errorMessage, "isEqual:"))
  {
    goto LABEL_71;
  }
  errorCode = self->_errorCode;
  if ((unint64_t)errorCode | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](errorCode, "isEqual:")) {
      goto LABEL_71;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_71;
    }
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:")) {
      goto LABEL_71;
    }
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_71;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_71;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 4) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 23)) {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 0x10) == 0) {
      goto LABEL_71;
    }
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((unsigned char *)v4 + 145)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 145))
    {
      goto LABEL_71;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 8) != 0)
    {
      if (self->_arrivedFromAd)
      {
        if (!*((unsigned char *)v4 + 144)) {
          goto LABEL_71;
        }
        goto LABEL_48;
      }
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_48;
      }
    }
LABEL_71:
    char v20 = 0;
    goto LABEL_72;
  }
  if ((*((unsigned char *)v4 + 148) & 8) != 0) {
    goto LABEL_71;
  }
LABEL_48:
  iadQtoken = self->_iadQtoken;
  if ((unint64_t)iadQtoken | *((void *)v4 + 9) && !-[NSString isEqual:](iadQtoken, "isEqual:")) {
    goto LABEL_71;
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:")) {
      goto LABEL_71;
    }
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_71;
    }
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_71;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_71;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 148) & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 16)) {
      goto LABEL_71;
    }
  }
  else if (*((unsigned char *)v4 + 148))
  {
    goto LABEL_71;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 10) && !-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
    goto LABEL_71;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](topicIds, "isEqual:")) {
      goto LABEL_71;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_71;
    }
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 15)) {
    char v20 = -[NSString isEqual:](surfacedByChannelId, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_72:

  return v20;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v24 = 2654435761 * self->_successfulNewsTokenVerification;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v23 = 2654435761 * self->_paidSubscriptionConversionPointType;
      goto LABEL_6;
    }
  }
  uint64_t v23 = 0;
LABEL_6:
  NSUInteger v22 = [(NSString *)self->_errorMessage hash];
  NSUInteger v21 = [(NSString *)self->_errorCode hash];
  NSUInteger v20 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v19 = [(NSString *)self->_sectionId hash];
  NSUInteger v18 = [(NSString *)self->_articleId hash];
  uint64_t v16 = [(NSData *)self->_articleViewingSessionId hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v3 = 2654435761 * self->_parentFeedType;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v4 = 2654435761 * self->_subscriptionOnlyArticlePreview;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    uint64_t v5 = 2654435761 * self->_arrivedFromAd;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
LABEL_13:
  NSUInteger v6 = [(NSString *)self->_iadQtoken hash];
  uint64_t v7 = [(NSData *)self->_subscriptionPurchaseSessionId hash];
  NSUInteger v8 = [(NSString *)self->_campaignId hash];
  NSUInteger v9 = [(NSString *)self->_campaignType hash];
  NSUInteger v10 = [(NSString *)self->_creativeId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v9 ^ v10 ^ v11 ^ [(NTPBIssueData *)self->_issueData hash];
  uint64_t v13 = v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v12 ^ [(NSMutableArray *)self->_topicIds hash];
  NSUInteger v14 = [(NSString *)self->_surfacedByTopicId hash];
  return v13 ^ v14 ^ [(NSString *)self->_surfacedByChannelId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 148);
  if ((v6 & 0x20) != 0)
  {
    self->_successfulNewsTokenVerification = *((unsigned char *)v4 + 146);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v4 + 148);
  }
  if ((v6 & 2) != 0)
  {
    self->_uint64_t paidSubscriptionConversionPointType = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 7)) {
    -[NTPBAlreadySubscriberSignIn setErrorMessage:](self, "setErrorMessage:");
  }
  if (*((void *)v5 + 6)) {
    -[NTPBAlreadySubscriberSignIn setErrorCode:](self, "setErrorCode:");
  }
  if (*((void *)v5 + 13)) {
    -[NTPBAlreadySubscriberSignIn setSourceChannelId:](self, "setSourceChannelId:");
  }
  if (*((void *)v5 + 12)) {
    -[NTPBAlreadySubscriberSignIn setSectionId:](self, "setSectionId:");
  }
  if (*((void *)v5 + 1)) {
    -[NTPBAlreadySubscriberSignIn setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 2)) {
    -[NTPBAlreadySubscriberSignIn setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  char v7 = *((unsigned char *)v5 + 148);
  if ((v7 & 4) != 0)
  {
    self->_uint64_t parentFeedType = *((_DWORD *)v5 + 23);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v5 + 148);
    if ((v7 & 0x10) == 0)
    {
LABEL_19:
      if ((v7 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v5 + 148) & 0x10) == 0)
  {
    goto LABEL_19;
  }
  self->_subscriptionOnlyArticlePreview = *((unsigned char *)v5 + 145);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v5 + 148) & 8) != 0)
  {
LABEL_20:
    self->_arrivedFromAd = *((unsigned char *)v5 + 144);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_21:
  if (*((void *)v5 + 9)) {
    -[NTPBAlreadySubscriberSignIn setIadQtoken:](self, "setIadQtoken:");
  }
  if (*((void *)v5 + 14)) {
    -[NTPBAlreadySubscriberSignIn setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
  }
  if (*((void *)v5 + 3)) {
    -[NTPBAlreadySubscriberSignIn setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v5 + 4)) {
    -[NTPBAlreadySubscriberSignIn setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBAlreadySubscriberSignIn setCreativeId:](self, "setCreativeId:");
  }
  if (*((unsigned char *)v5 + 148))
  {
    self->_uint64_t groupType = *((_DWORD *)v5 + 16);
    *(unsigned char *)&self->_has |= 1u;
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
    -[NTPBAlreadySubscriberSignIn setIssueData:](self, "setIssueData:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v5 + 17);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NTPBAlreadySubscriberSignIn addTopicIds:](self, "addTopicIds:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  if (*((void *)v5 + 16)) {
    -[NTPBAlreadySubscriberSignIn setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v5 + 15)) {
    -[NTPBAlreadySubscriberSignIn setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
}

- (BOOL)successfulNewsTokenVerification
{
  return self->_successfulNewsTokenVerification;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
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

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
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
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end